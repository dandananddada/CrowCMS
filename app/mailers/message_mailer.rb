class MessageMailer < ApplicationMailer
	def message_reply(admin_message)
		@admin_message = admin_message
		mail 	to: admin_message.email, 
				subject: 'Your message have replyed',
				template_path: 'mailer',
				template_name: 'message_reply'
	end
end
