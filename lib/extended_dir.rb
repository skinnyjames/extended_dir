module ArrayRefinement
  refine Array do
    def sort_by_with_index!
      sort_by! do |member|
        yield member, index(member)
      end
    end
  end
end

class ExtendedDir
  using ArrayRefinement

  def self.files(path, order: [])
    sort_files(path, order)
  end

  def self.require_all(path, order: [])
    sort_files(path, order, is_ruby: true).each { |file| require file }
  end

  def self.load_all(path, order: [])
    sort_files(path, order, is_ruby: true).each { |file| load file }
  end

  private

  def self.sort_files(path, order, is_ruby: false)
    pattern = is_ruby ? "#{path}/**/*.rb" : "#{path}/**/*.*"
    files = Dir.glob(pattern)
    files.sort_by_with_index! do |file, i|
      index = order.find_index do |ordered_file|
        entries = Dir.glob("#{path}/#{ordered_file}")
        entries.include? file
      end
      index || order.length + i
    end
  end
end