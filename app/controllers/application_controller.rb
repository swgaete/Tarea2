require 'net/http'
require 'json'

class ApplicationController < ActionController::Base
def crearDatos(cantidad, media)
    respuesta={ "metadata" => {},
                "posts" => [],
                "version" => ""
    }
    respuesta['metadata']=cantidad['data']['media_count']

    media['data'].each do |item|
    respuesta['posts']<<{
     'tags'=> item['tags']
     'username'=> item['user']['username']
     'likes'=> item['likes']
     'url'=> maximaResolucion(item['images'])
     'caption' =>  item['caption']['text']
    }
    #falta ver lo de la version y lo de la calidad de las imagenes
    #:Bad_request para lo del error de 400
    return reponse
  end

  def parametros

    tag =params[:tag]
    access_token = params[:access_token]
    uriCantidad= 'https://api.instagram.com/v1/tags/' + tag.to_s + '?access_token=' + access_token.to_s
    uri= 'https://api.instagram.com/v1/tags/'+ tag.to_s + '/media/recent?access_token='+ access_token.to_s
    cantidad = get(uriCantidad)
    media = get(uri)
    reponse = crearDatos(cantidad, media)
    render {}
    render json: response, root: false

  end

  def get(uri)
    uri = URI.parse(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl=true
    request = Net::HTTP::Get.new(uri.request_uri)
    respuesta = http.request(request)
    return JSON.parse(respuest.body)
  end

 

  def maximaResolucion(imagen)
    if imagen.has_key?('standard_resolution')
      return imagen['standard_resolution']['url']
    elsif imagen.has_key?('low_resolution')
      return imagen['low_resolution']['url']
    else
      return imagen['thumbnail']['url']
    end
  end
  end    
  #protect_from_forgery with: :exception
end
