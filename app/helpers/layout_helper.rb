module LayoutHelper
  def flash_messages(opts={})
    @layout_flash = opts.fetch(:layout_flash) { true }

    capture do
      flash.each do |name, msg|
        name = (name.to_s == 'notice') ? 'success' : 'danger'
        flash_message = %Q(
                           <div class="alert alert-#{name}">
                             <a class="close" data-dismiss="alert">&#215;</a>
                               <div id="flash_#{name}">#{msg}</div>
                           </div>
                          )
        concat flash_message.html_safe
      end
    end
  end

  def show_layout_flash?
    @layout_flash.nil? ? true : @layout_flash
  end
end
