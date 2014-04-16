require 'spec_helper'

describe 'ssh::user::config', :type => :define do

    let (:title) { 'myspectest' }
    it do
        should compile
    end
end
