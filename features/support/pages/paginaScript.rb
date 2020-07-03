class PaginaScript

  include RSpec::Matchers
  include Capybara::DSL

  def script_retira_leve_pdp
    execute_script("return (function(){
    var item = localStorage.getItem('AB_TEST_MapModeRetira'); item = JSON.parse(item); item.data.result = 1; item = JSON.stringify(item); localStorage.setItem('AB_TEST_MapModeRetira', item)
    })()")
    page.driver.browser.navigate.refresh
  end

  def script_retira_mapa_pdp
    execute_script("return (function(){
    var item = localStorage.getItem('AB_TEST_MapModeRetira'); item = JSON.parse(item); item.data.result = 0; item = JSON.stringify(item); localStorage.setItem('AB_TEST_MapModeRetira', item)
    })()")
    page.driver.browser.navigate.refresh
  end

  def script_retira_leve_checkout
    execute_script("return (function(){
    var item = localStorage.getItem('AB_TEST_CheckoutModeRetira'); item = JSON.parse(item); item.data.result = 1; item = JSON.stringify(item); localStorage.setItem('AB_TEST_CheckoutModeRetira', item)
    })()")
    page.driver.browser.navigate.refresh
  end

  def script_checkout_com_resumo
    execute_script("return (function(){
    var item = localStorage.getItem('AB_TEST_CheckoutSemResumo'); item = JSON.parse(item); item.data.result = 1; item = JSON.stringify(item); localStorage.setItem('AB_TEST_CheckoutSemResumo', item)
    })()")
    page.driver.browser.navigate.refresh
  end
end
