module ApplicationHelper
  def admin_only(&block)
    block.call if current_user.try(:admin)
  end

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Блог").join(" - ")
      end
    end
  end

  def main_page
    Page.where(primary: true).first
  end
end
