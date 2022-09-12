class SendMailWith3CommentsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # TODO: si el post recibe más de 3 comentarios, enviar un correo el dueño del post
  end
end
