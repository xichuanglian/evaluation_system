root = exports ? this
root.students =
    init: () ->
    profile: () ->
      $('div#new_education').hide()
      $('div#new_classes_taken').hide()
      $('div#new_publication').hide()
      $('div#new_academic_activity').hide()
      $('button#new_education_button').click(
        () -> $('div#new_education').toggle())
      $('button#new_classes_taken_button').click(
        () -> $('div#new_classes_taken').toggle())
      $('button#new_publication_button').click(
        () -> $('div#new_publication').toggle())
      $('button#new_academic_activity_button').click(
        () -> $('div#new_academic_activity').toggle())
