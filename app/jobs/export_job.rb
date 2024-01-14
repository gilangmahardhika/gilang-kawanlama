class ExportJob < ApplicationJob
  queue_as :export

  karafka_options(
    dispatch_method: :produce_sync
  )

  def perform(*args)
    # Do something later
  end
end
