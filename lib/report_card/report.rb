module ReportCard
  class Report
    class ReportNotFound < StandardError; end

    def self.all
      subclasses
    end

    def self.human_name
      name.titleize
    end

    def self.find(name)
      fail ReportNotFound, "Report #{name} not found" unless exists?(name)
      name.constantize
    end

    def self.exists?(name)
      all.any? { |r| r.name == name }
    end
  end
end
