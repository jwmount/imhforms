ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

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
         panel "Info" do
           para "Welcome to Progress Watch."
           para "No announcements are available."
         end
       end

       column do
         panel "School Progress" do
          @str = Date.today()
           table do
             tr
               th 'Behavior'
               th Date.today()
               th Date.today() + 14
               th Date.today() + 28
               th Date.today() + 42
               th Date.today() + 56
             tr
               td 'Facilitated by Adult'
               td '1.4'
               td '1.6'
               td '2.2'
               td '2.3'
               td '3.4'
             tr
               td 'Initiated by Child'
               td '1.8'
               td '2.0'
               td '2.3'
               td '2.3'
               td '2.4'
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
