require 'spec_helper'

describe 'ssh::user::private_key', :type => :define do

    let (:title) { 'mykey' }
    let (:params) {{
        :content => "mykeylol"
    }}
    it do
        should compile
    end
    context "with user and content" do
        let (:params) {{
            :user => 'john',
            :content => "mykeylol"
        }}
        it {
            should contain_file("/home/john/.ssh/mykey.key")
                .with_owner('john')
                .with_mode('0600')
                .with_content('mykeylol')
        }
    end
    context "with user and keypath" do
        let (:params) {{
            :user => 'john',
            :key_path => "/root/.ssh/mykey",
            :content => "mykeylol"
        }}
        it {
            should contain_file("/root/.ssh/mykey")
                .with_owner('john')
                .with_mode('0600')
                .with_content('mykeylol')
        }
    end
    context "with user and file path" do
        let (:params) {{
            :user => 'john',
            :source => "/doop/poop.key"
        }}

        it {
            should contain_file("/home/john/.ssh/mykey.key")
                .with_owner('john')
                .with_mode('0600')
                .with_source("puppet:///doop/poop.key")
        }
    end
end
