class CalculationsService
  def initialize(hourly_wage, working_hour)
    raise ArgumentError, "自然数を入力してください。" if hourly_wage <= 0 || working_hour <= 0

    @hourly_wage = hourly_wage
    @working_hour = working_hour
  end

  def salary
    @hourly_wage * @working_hour
  end

  def after_tax
    (salary - tax).to_i
  end

  def tax
    tax_list = [
      [ 40000000, 0.45, 4796000 ],
      [ 18000000, 0.40, 2796000 ],
      [ 9000000,  0.33, 1536000 ],
      [ 6950000,  0.23, 636000 ],
      [ 3300000,  0.20, 427500 ],
      [ 1950000,  0.10, 97500 ],
      [ 0,        0.05, 0 ]
    ]

    tax_list.each do |limit, rate, deduction|
      return salary * rate - deduction if salary > limit
    end
  end
end
