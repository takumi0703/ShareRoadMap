# frozen_string_literal: true

module StudyHelper
  def study_material(study)
    if study.material.empty?
      '学習教材：未定'
    else
      "学習教材：#{study.material}"
    end
  end

  def study_period(study)
    if study.period.nil?
      '学習完了予定日：未定'
    else
      "学習完了予定日：#{study.period}まで"
    end
  end
end
