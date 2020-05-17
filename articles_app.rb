require "selenium-webdriver"

#Main program
def main
    driver = startWebDriver
    goToArticles(driver)
    createArticle(driver)
    loadComments(3,driver)
    editArticle(driver)
    showArticles(driver)
    destroyArticle(driver)
end


#FUNCTIONS
def startWebDriver
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to "https://articles-app-ror.herokuapp.com"
    return driver    
end

def goToArticles(driver)
    element = driver.find_element(xpath: "/html/body/nav/div/div[2]/ul/li/a")
    element.click
end

def createArticle(driver)
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { driver.find_element(xpath: "/html/body/div/button[1]/a") }
    element = driver.find_element(xpath: "/html/body/div/button[1]/a")
    element.send_keys :space
    driver.navigate.to "https://admin:admin@articles-app-ror.herokuapp.com/articles/new"
    wait.until { driver.find_element(xpath: "//*[@id='article_title']") }
    element = driver.find_element(xpath: "//*[@id='article_title']")
    element.click
    element.send_keys("Article Test")
    element = driver.find_element(xpath: "//*[@id='article_text']")
    element.send_keys("Article using Selenium WebDriver")
    element = driver.find_element(xpath: "/html/body/div/form/p[3]/input")
    element.click
end

def loadComments(max,driver)
    cont = 0
    while cont<max
        element = driver.find_element(xpath: "//*[@id='comment_commenter']")
        element.click
        element.send_keys("Bot #{cont}")
        element = driver.find_element(xpath: "//*[@id='comment_body']")
        element.click
        element.send_keys("I am in a for loop in the position = #{cont}. Great Article btw!")
        element = driver.find_element(xpath: "/html/body/div/div[3]/form/ul/li/p[3]/input")
        element.click
        cont+= 1
    end
end

def editArticle(driver)
    editButton = driver.find_element(xpath: "/html/body/div/div[1]/div/ul/button[1]/a")
    editButton.click
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { driver.find_element(xpath: "//*[@id='article_title']") }
    articleTitle = driver.find_element(xpath: "//*[@id='article_title']")
    articleTitle.send_keys(" EDITED")
    articleText = driver.find_element(xpath: "//*[@id='article_text']")
    articleText.send_keys(" EDITED")
    buttonUpdateArticle = driver.find_element(xpath: "/html/body/div/form/p[3]/input")
    buttonUpdateArticle.click
end

def showArticles(driver)
    
    backButton = driver.find_element(xpath: "//html/body/div/div[1]/div/ul/button[2]/a")
    backButton.click
end

def destroyArticle(driver)
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { driver.find_element(xpath: "/html/body/div/table/tbody/tr/td[3]/i[3]/a") }
    destroyButton = driver.find_element(xpath: "/html/body/div/table/tbody/tr/td[3]/i[3]/a")
    destroyButton.click
    driver.switch_to.alert().accept()
end

main