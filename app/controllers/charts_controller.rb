class ChartsController < ApplicationController
  include ChartUtils
  helper_method :color_set
  # GET /charts
  # GET /charts.json
  def index
    @charts = Chart.all
    json_file = Dir["app/assets/jsons/*.json"]

    data = []
    date_hash = []

    # binding.pry
    json_file.each_with_index do |json, i|
      _parsed_file = JSON.parse(File.read(json))
      word_counts = _parsed_file.sort_by{ |k,v| k }.last(100).to_h
      date_hash << word_counts.keys

      line_data = Hash.new
      line_data[:label] = json.gsub('_parsed.json', '').gsub('app/assets/jsons/', '') # 檔名
      line_data[:backgroundColor] = "rgba(0,0,0,0)"
      line_data[:pointBackgroundColor] = color_set(alpha: 1)[i]
      line_data[:borderColor] = color_set(alpha: 1)[i]
      line_data[:pointBorderColor] = "#fff"
      line_data[:pointHighlightFill] = "#fff"
      line_data[:highlightBackgroundColor] = color_set(alpha: 0.2)[i]
      line_data[:pointHighlightStroke] = color_set(alpha: 1)[i]
      line_data[:hoverBackgroundColor] = color_set(alpha: 0.2)[i]
      line_data[:borderWidth] = 2
      line_data[:data] = word_counts.values
      # binding.pry
      # binding.pry
      data.push(line_data)
    end

    # binding.pry

    @data = {
      labels: date_hash.flatten.uniq,
      datasets: data
    }
      # binding.pry

    @options = {
      responsive: true,
      height: 240,
      legend: {
        display: true,
        width: 20
      }
    }
  end

  # GET /charts/1
  # GET /charts/1.json
  def show
    filename = params[:id]
    json_file = Dir["app/assets/jsons/#{filename}_parsed.json"][0]
    parsed_file = JSON.parse(File.read(json_file))
    date_hash = parsed_file.keys.sort
    word_counts = parsed_file.sort_by{ |k,v| k }.to_h

    # binding.pry

    @data = {
      labels: word_counts.keys,
      datasets: [
        {
          label: filename,
          backgroundColor: "rgba(220,220,220,0.2)",
          borderColor: "rgba(220,220,220,1)",
          data: word_counts.values
        }
      ]
    }

    @options = {
      responsive: true,
      height: 240,
      legend: {
        display: true,
        width: 20
      }
    }
  end

end
