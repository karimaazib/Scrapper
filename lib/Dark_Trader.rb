require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

def names(page)
    array_names = []
    currency_names = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div')

    currency_names.each do |names|
        array_names << names.text
    end
    return array_names
end

def values(page)
    array_values = []
    currency_values = page.xpath ('/html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a')

    currency_values.each do |values|
        array_values << values.text
    end
    return array_values
end

def hash_crypto(page)
    hash_crypto = Hash[names(page).zip(values(page))]
    return hash_crypto
end
 puts hash_crypto (page)