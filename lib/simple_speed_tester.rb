require "simple_speed_tester/version"

##
# Usage Example: SimpleSpeedTester.measure("request to google.com", times: 10) { HTTParty.get('https://www.google.com') }
class SimpleSpeedTester
  class << self

    ##
    # @param profile_id [String|Symbol] What key should we use to reference this speed test later? If not specified then we'll just create one.
    # @option times [Integer] (optional) How many times should we run this test? You can run the class method multiple times but you can also set this number to easily run it multiple times in one line.
    def measure(profile_id = "unspecified_task-#{Time.now.to_i}", times: 1)
      times.times do

        start_time = Time.current
        result = yield
        time_elapsed = Time.current - start_time

        # Add to the profiler's data store
        add_result(profile_id, time_elapsed.to_f)

        result
      end

      print_summary
    end
    def summary
      @profiler_data
    end

    def print_summary
      return if @profiler_data.blank?

      @profiler_data.keys.each do |profile_id|
        puts "#{profile_id} >>> #{@profiler_data[profile_id]}"
      end
    end

    def print_profile(profile_id)
      return if @profiler_data.blank?

      puts @profiler_data[profile_id]
    end

    def clear!
      @profiler_data = {}
    end

    private

    def add_result(profile_id, time_elapsed)
      @profiler_data ||= {}
      @profiler_data[profile_id] ||= {}
      @profiler_data[profile_id][:total_time] = @profiler_data[profile_id][:total_time].to_f + time_elapsed.to_f
      @profiler_data[profile_id][:times_called] = @profiler_data[profile_id][:times_called].to_i + 1
      @profiler_data[profile_id][:avg_time] = @profiler_data[profile_id][:total_time] / @profiler_data[profile_id][:times_called]
    end

  end
end

