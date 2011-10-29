require "spec_helper"

describe "#url_builder" do
  
  # let(:url) {'http://google.com'}
  def url
    "http://google.com"
  end

  context "when given no parameters should default to a query with 10 results" do
    it "should call the basic url" do
      url_builder(url).should == "#{url}?results=10"
    end
  end
  
  context "when given a single parameter" do
    it "appends the parameters to the url" do
      url_builder(url, :results => 20).should == "#{url}?results=20"
      # url_builder(URL, :results => 20).should == "#{URL}?results=20"
      # url_builder('http://google.com', :results => 20).should == "#{url}?results=20"
      # url_builder(url, :results => 20).should == "http://google.com?results=20"
    end
  end
  
  context "when given multiple parameters" do
    it "should append each parameter with an &" do
      url_builder(url, :results => '20', :search => 'burgers').should == "#{url}?results=20&search=burgers"
      # url_builder('http://google.com', :results => '20', :search => 'burgers').should == "#{url}?results=20&search=burgers"
      # url_builder(url, :results => '20', :search => 'burgers').should == "http://google.com?results=20&search=burgers"
    end
  end
  
  context "when a parameter is nil" do
    it "should ignore the parameter" do
      url_builder(url, :results => '20', :search => 'burgers', :sort_by => nil).should == "#{url}?results=20&search=burgers"
      # url_builder('http://google.com', :results => '20', :search => 'burgers', :sort_by => nil).should == "#{url}?results=20&search=burgers"
      # url_builder(url, :results => '20', :search => 'burgers', :sort_by => nil).should == "http://google.com?results=20&search=burgers"
    end
  end
  
  it "should fail" do
    fail
  end
  
end
