class Api::FeedsController < ApplicationController
  def update_xml    
    
    # -------------------------------
    # could be added error when cannot find a file

    file_path = 'public/xmls/bbc.xml'
    feeds_xml = Nokogiri::XML(File.open(file_path))
    
    new_feed =        
      " <liked_feed>
          <title>#{params[:title]}</title>
          <link>#{params[:link]}</link>
          <description>#{params[:desc]}</description>
          <pub_date>#{params[:pub_date]}</pub_date>
        </liked_feed>
      "   
    
    # -------------------------------
    # could be added error when cannot save a file

    feeds_xml.root.add_child new_feed

    
    File.write(file_path, feeds_xml.to_xml)

    render json: { 
      status: "SUCCESS", 
      message: "XML file updated", 
      data: "data"}, 
    status: :ok
  end
end