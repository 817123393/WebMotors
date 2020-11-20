require 'selenium-webdriver'
require 'report_builder'

Before do |scenario|
  @ofertas = Ofertas.new

  Capybara.current_session.driver.browser.manage.delete_all_cookies
  Capybara.page.driver.browser.manage.window.maximize
end

After do |scenario|
  if scenario.failed?
    binding.pry
  end


  at_exit do
      ReportBuilder.configure do |config|
        config.input_path = 'data/reports'
        config.report_path = 'data/reports/report_webmotors'
        config.report_types = [:html]
        config.report_title = 'Report_WEBMOTORS'
        t = Time.now
        t.to_s
        config.additional_info = { browser: 'Chrome', environment: 'Stage 5', Data: t.strftime("%d/%m/%y"), Horário: t.strftime("%H:%M:%S") }
        config.include_images = true
      end
    ReportBuilder.build_report
  end

end
