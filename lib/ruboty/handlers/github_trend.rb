require 'ghtrend'

module Ruboty
  module Handlers
    class GithubTrend < Base
      include Ghtrend
      on /trend\z/, name: 'execute', description: 'GitHub trend.'

      def execute(message)
        text = "```\n"
        text << "====================\n"
        ::Ghtrend.trend.each do |repo|
          text << "Repository  : #{repo[:name]}(#{repo[:url]})\n"
          text << "Description : #{repo[:description]}\n"
          text << "Lang & Star : #{repo[:meta]}\n"
          text << "====================\n"
        end
        text << '```'
        message.reply(text)
      end
    end
  end
end
