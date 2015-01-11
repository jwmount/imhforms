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
     columns do

       column do
         panel "Welcome to Infant Mental Health Forms" do
           para "Jan 4, 2015 -- Individual student evaluation details by recorder are available."
         end
       end

       column do
         panel "School Progress (MOCKUP)" do
          @str = Date.today()
           table do
             tr
               th 'Behavior'
               th Date.today() - 56
               th Date.today() - 42
               th Date.today() - 28
               th Date.today() - 14
               th Date.today()
             behaviors.each do |behavior|
               tr
                 td behavior.gsub('_',' ').capitalize!
                 td '1.4'
                 td '1.6'
                 td '2.2'
                 td '2.3'
                 td '3.4'
             end  
           table

           end
         end
       end

       column do
         panel "Student Progress Summaries" do
           ul do
             Student.all.each do |student|
               li link_to(student.name, admin_student_path(student))
             end
           end
         end
       end


     end

  end # content
end
