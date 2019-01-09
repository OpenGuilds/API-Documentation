module DatasetHelper
  def dataset
    {
      object: "Dataset",
      id: "1",
      name: "My Audio Transcription Dataset",
      description: "This dataset contains audio transcriptions",
      data: list_for([datum(1), datum(2), datum(3)], 'api/dataset/1/data'),
      created: "2015-05-22T14:56:29.000Z",
      updated: "2015-05-22T14:56:28.000Z"
    }
  end

  private

  def datum(id = 1)
    {
      object: "Datum",
      id: "#{id}",
      status: "completed",
      parameters: {
        audio_url: "www.audio.com/audio#{id}.wav",
        transcription: "There once was a man from peru..."
      }
    }
  end
end
