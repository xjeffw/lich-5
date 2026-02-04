#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require 'json'

# Set up paths relative to the script location
LICH_DIR = File.dirname(File.expand_path(__FILE__))
LIB_DIR = File.join(LICH_DIR, 'lib')
DATA_DIR = File.join(LICH_DIR, 'data')

$LOAD_PATH.unshift(LIB_DIR)

# Mocks for non-CLI dependencies and missing constants
module OS
  def self.windows?; false; end
  def self.linux?; true; end
  def self.mac?; false; end
end

module FFI
  module Library
    def ffi_lib(*args); end
    def attach_function(*args); end
    def layout(*args); end
  end
  class Struct
    def self.layout(*args); end
  end
end

module Gtk
  def self.queue; end
  class Box; end
  class Label; end
  class Window; end
  class Button; end
  class Entry; end
  class CheckButton; end
  class ComboBoxText; end
  class Notebook; end
end

module Lich
  def self.log(msg); end
  module Util
    def self.install_gem_requirements(gems); end
  end
  module Common
    module GUI
    end
  end
end

# Load necessary project libraries
require 'common/gui/yaml_state'
require 'common/gui/account_manager'

# Use the AccountManager to retrieve and print accounts and characters in JSON format
begin
  accounts = Lich::Common::GUI::AccountManager.get_all_accounts(DATA_DIR)
  puts JSON.pretty_generate(accounts)
rescue => e
  $stderr.puts "Error: #{e.message}"
  $stderr.puts e.backtrace
  exit 1
end
