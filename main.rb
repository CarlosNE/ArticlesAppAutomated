require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(xpath: "/html/body/div/div[3]/form/div[2]/div[1]/div[1]/div/div[2]/input")
element.send_keys "Hello WebDriver!"
element.submit

wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
wait.until { driver.find_element(xpath: "/html/body/div[6]/div[2]/div[9]/div[1]/div[2]/div/div[2]/div[2]/div/div/div[1]/div/div[1]/a/h3") }


element = driver.find_element(xpath: "/html/body/div[6]/div[2]/div[9]/div[1]/div[2]/div/div[2]/div[2]/div/div/div[1]/div/div[1]/a/h3")
element.click


element = driver.find_element(xpath: "/html/body/div[3]/nav/div/span/i")
element.click

element = driver.find_element(xpath: "//*[@id='s']")
element.click
element.send_keys "Ruby"
element.send_keys :enter


wait.until { driver.find_element(xpath: "/html/body/div[3]/div[5]/div[2]/div/div[1]/div[3]/div[1]/div/div[1]/div[1]/a/span") }
element = driver.find_element(xpath: "/html/body/div[3]/div[5]/div[2]/div/div[1]/div[3]/div[1]/div/div[1]/div[1]/a/span")
element.click

puts element
puts driver.title

# driver.quit