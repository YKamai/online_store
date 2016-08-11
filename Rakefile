#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

OnlineStore::Application.load_tasks

ENV['PRODUCT_DATA_FILES_PATH'] ||= './data_files'
ENV['MONGOID_ENV'] ||= 'development'
Mongoid.load!(File.expand_path('mongoid.yml', './config'))

namespace :db do
	task :seed_products_from_files do
    require_relative 'data_helper'

		data = DataHelper.parse_products_from_xml
    DataHelper.load_products(data)
	end
end
