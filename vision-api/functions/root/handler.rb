def handler event
  response = {
    'message' => "Welcome to FaaStRuby Local! Edit the function 'root' to customize this response."
  }
  render json: response
end


require "google/cloud/vision"


def annotate_image
	image_annotator_client = Google::Cloud::Vision::ImageAnnotator.new
	gcs_image_uri = "gs://gapic-toolkit/President_Barack_Obama.jpg"
	source = { gcs_image_uri: gcs_image_uri }
	image = { source: source }
	type = :FACE_DETECTION
	features_element = { type: type }
	features = [features_element]
	requests_element = { image: image, features: features }
	requests = [requests_element]
	response = image_annotator_client.batch_annotate_images(requests)
end
