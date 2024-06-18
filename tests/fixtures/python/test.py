import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

class GoogleSearchTest(unittest.TestCase):

    def setUp(self):
        # Configura le opzioni di Chrome
        chrome_options = webdriver.ChromeOptions()
        self.driver = webdriver.Remote(
            command_executor='http://localhost:4444/wd/hub',
            options=chrome_options
        )

    def test_search_openai(self):
        driver = self.driver
        # Apri Google
        driver.get("http://apache")
        time.sleep(40)

        driver.send_keys(Keys.TAB)
        driver.send_keys(Keys.RETURN)


        # Attendi che il campo di ricerca sia presente e interattivo
        search_box = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.NAME, "q"))
        )
        search_box.send_keys("OpenAI")
        search_box.send_keys(Keys.RETURN)

        # Attendi qualche secondo per vedere i risultati
        WebDriverWait(driver, 10).until(
            EC.title_contains("OpenAI")
        )

        # Verifica che il titolo della pagina contenga "OpenAI"
        self.assertIn("OpenAI", driver.title)

    def tearDown(self):
        # Chiudi il browser
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()