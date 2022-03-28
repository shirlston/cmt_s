class Taxonomy < ApplicationRecord
  belongs_to :npi_record

  def to_s
    taxonomy =
    <<~TAXONOMY
     Code: #{code}<br/>
     Description #{desc}<br/>
     Primary: #{primary}<br/>
     State: #{state}<br/>
     License: #{license}<br/>
    TAXONOMY

    taxonomy.html_safe
  end

end
