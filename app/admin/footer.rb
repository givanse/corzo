# http://stackoverflow.com/a/20510985/7852

module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"
        super :style => "text-align: center;"

        span "Corzo #{Date.today.year}"
      end

    end
  end
end
