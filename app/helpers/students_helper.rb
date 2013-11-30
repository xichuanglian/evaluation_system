module StudentsHelper
  def students_page(page, user)
    page_path = "students_" + page.to_s + "_path"
    self.send(page_path.to_sym, user)
  end
end
