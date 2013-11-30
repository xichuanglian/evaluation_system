module TeachersHelper
  def teachers_page(page, user)
    page_path = "teachers_" + page.to_s + "_path"
    self.send(page_path.to_sym, user)
  end
end
