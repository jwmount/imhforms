require 'date'
ActiveAdmin.register_page "Dashboard" do

#  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
=begin
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
=end
    # Here is an example of a simple dashboard with columns and panels.
    #

     
    panel "Welcome to Infant Mental Health Forms" do
      para "Jan 4, 2015 -- Individual student evaluation details by recorder are available."
    end

     columns do


       column do
         panel "School Progress" do
          @str = Date.today()
           table do
             tr
               th 'Behavior'
               date_buckets.each do |bucket|
                 th bucket.min.strftime("%b %d, %Y")
               end
             behaviors.each do |behavior|
               tr
                 td behavior.gsub('_',' ').capitalize!
                 date_buckets.each do |bucket|
                   td overall behavior, bucket
                 end
             end  
           table
           para "Legend: 0 - Skipped, 1 - Not present, 2 - Fleeting, 3 - Stable"

           end
         end
       end

       column do
         panel "Student Progress Summaries" do
           table do
             tr
               th 'Student'
               th '# Obs'
               th 'From'
               th 'Until'
             
             Student.all.each do |student|
               tr
                 td link_to(student.name, admin_student_path(student))
                 td student.developmental_levels.count
                 if student.developmental_levels.count > 0 
                   td student.developmental_levels.minimum("observed_on").strftime("%b %d, %Y")
                   td student.developmental_levels.maximum("observed_on").strftime("%b %d, %Y")
                 end #if
             end #student
           end #table
         end #column

       end

     end #columns


  end # content
end
