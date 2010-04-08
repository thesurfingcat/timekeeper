class EnglishassessmentReport < ApplicationReport
  
  def initialize(app,choice) 
    @app = App.find(app) 
    @choice = Choice.find(choice)
    @courseinstance = Courseinstance.find(@choice.courseinstance_id)  
    @course = Course.find(@courseinstance.course_id)
    @name = @app.given_names.to_s + " " + @app.surname.to_s 
    @ielts = @choice.int_english_qual_course_grade     
    @sigs = "#{RAILS_ROOT}/public/images/AHood.jpg"   
  end

  def render_header
  end

  def render_body 
    pdf.tags :bold => { :font_family => "#{RAILS_ROOT}/public/fonts/Arial Bold.ttf"  }  
    pdf.font "#{RAILS_ROOT}/public/fonts/Arial.ttf" 
    
    pdf.font_size 10   
    pdf.move_down(50)
    pdf.text Time.now.strftime("#{Time.now.day.ordinalize} %B %Y") 
    pdf.move_down(20)
    pdf.text "<bold>English Language Assessment</bold>", :align => :center, :size => 16 
    pdf.move_down(20)
    pdf.text "This is to confirm that #{@name} has taken the University of Glamorgan English Grammar and Usage Test and Written Test under supervision and has achieved a score which roughly equates to an IELTS level of #{@ielts}. The University of Glamorgan is satisfied that #{@name} has an English language level suitable to follow the following programme of study:"
    pdf.move_down(20)
    pdf.text @course.coursetitle
    pdf.move_down(20)
    pdf.text "If you have any questions with regard to any of the above please do contact me." 
    pdf.move_down(20)
    pdf.text "Regards"
    pdf.move_down(5)
    pdf.image @sigs, :scale => 0.7
    pdf.move_down(5)
    pdf.text "A Hood"
    pdf.text "Admissions Manager"
    pdf.text "Enquiries & Admissions Unit"     
  end 
end  