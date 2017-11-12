#!/usr/bin/env ruby

require "bundler/setup"
require "distancecalculator"
require 'distancecalculator/cli'

Distancecalculator::Cli.start(ARGV)
