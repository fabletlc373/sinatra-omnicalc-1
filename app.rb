require "sinatra"
require "sinatra/reloader"


get("/") do
  erb(:homepage)
end

get("/:operation/new") do
  @op = params.fetch('operation')
  if @op == 'square'
    erb(:homepage)
  elsif @op == 'square_root'
    erb(:srhomepage)
  elsif @op == 'payment'
    erb(:paymenthomepage)
  else
    erb(:randomhomepage)
  end
end

get("/:operation/results") do
  @op = params.fetch('operation')
  if @op == 'square'
    @num = params.fetch('number').to_f
    @num_sq = @num**2
    erb(:sresults)
  elsif @op == 'square_root'
    @num = params.fetch('user_number').to_f
    @num_sqr = @num ** 0.5
    erb(:srresults)
  elsif @op == 'payment'
    @apr = params.fetch('user_apr').to_f / 100
    @y = params.fetch('user_years').to_f
    @p = params.fetch('user_pv').to_f
    r = @apr / 12
    n = @y * 12
    @Payment = (r * @p) / (1-(1+r)**(-1 * n))
    erb(:paymentresults)
  else
    @min = params.fetch('user_min').to_f
    @max = params.fetch('user_max').to_f
    @r = rand(@min..@max)
    erb(:randomresults)
  end
end
