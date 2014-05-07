require 'open-uri'
require 'nokogiri'

class Company < ActiveRecord::Base
  validates :link, presence: true
  validates :name, presence: true

  def self.nokogiri_parse(company)
    Nokogiri::HTML(open("#{company.link}"))
  end

  def self.css_attr
     {
        'ruby news' => '#jobs-list a',
        'ruby insider' => '.title .jam_link',
        'rails job' => '.jobitem a',
        'ruby on rails jobs' => '#jobs-table a',
        'top ruby jobs' => '#jobs a',
        'engineer jobs' => '.jobtitle',
        'careers stackoverflow' => 'h3 .job-link',
        'monster' => '.fnt11 span',
        'indeed' => '.jobtitle a',
        'flex jobs' => '#joblist a'
     }
  end

  def self.companies(array)

    data = {}
    array.each do |company|
     data[company.name] = nokogiri_parse(company).css(Company.css_attr[company.name])
    end
    data
  end
end
