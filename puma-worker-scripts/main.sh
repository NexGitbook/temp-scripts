#!/usr/bin/env ruby

# vim:ft=ruby

require 'mail'

ENV['PATH'] = './mybin:' + ENV['PATH']

def main
	hasWorkers = `check-puma-workers-exists.sh`
	hasWorkers.strip!
	return if hasWorkers == "true"

	result = `restart-puma-if-no-workers.sh`
	result.strip!
	init_mail
	send_email(result)

  puts 'Done.'
rescue => e
	puts 'An error occurred!'
	puts e.message
end

def smtp_config
	{
		address: "smtp.mandrillapp.com",
		port: 587,
		domain: "fieldfolio.com",
		user_name: "alistair.newton@fieldfolio.com",
		password: 'nVze50lXtOgKAZsSeSslRQ',
		authentication: "plain",
		enable_starttls_auto: true
	}
end

def recipient_email
	"chanakasan@gmail.com"
end

def from_email
'bluefrogsoftware.com.au'
end

def init_mail
	Mail.defaults do
		delivery_method :smtp, smtp_config
	end
end

def send_email(result)
	if result == "restarted"
		subject_str = "Puma restart - success"
	else
		subject_str = "Puma restart - failed"
	end

	body_str = <<STR
Log output:
#{result}
STR

	mail = Mail.new do
		from from_email
		to recipient_email
		subject subject_str
		body body_str
	end

	mail.deliver!
	puts "Email sent"
end

main
