require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post :create, document: { box_id: @document.box_id, calle: @document.calle, cofi_id: @document.cofi_id, colonia: @document.colonia, document_type_id: @document.document_type_id, entidad_id: @document.entidad_id, entity_id: @document.entity_id, estado_id: @document.estado_id, fecha_auto_admisorio: @document.fecha_auto_admisorio, fecha_avaluo: @document.fecha_avaluo, fecha_escritura: @document.fecha_escritura, fecha_rpp: @document.fecha_rpp, folio_real_rpp: @document.folio_real_rpp, jurisdiccion_id: @document.jurisdiccion_id, libro_rpp: @document.libro_rpp, materno_acreditado: @document.materno_acreditado, materno_coacreditado_1: @document.materno_coacreditado_1, materno_coacreditado_2: @document.materno_coacreditado_2, materno_coacreditado_3: @document.materno_coacreditado_3, monto_avaluo: @document.monto_avaluo, municipio: @document.municipio, nombre_acreditado: @document.nombre_acreditado, nombre_archivo: @document.nombre_archivo, nombre_coacreditado_1: @document.nombre_coacreditado_1, nombre_coacreditado_2: @document.nombre_coacreditado_2, nombre_coacreditado_3: @document.nombre_coacreditado_3, nombre_notario: @document.nombre_notario, numero_credito: @document.numero_credito, numero_demanda: @document.numero_demanda, numero_escritura: @document.numero_escritura, numero_expediente: @document.numero_expediente, numero_juzgado: @document.numero_juzgado, numero_notaria: @document.numero_notaria, originator_id: @document.originator_id, partida_rpp: @document.partida_rpp, paterno_acreditado: @document.paterno_acreditado, paterno_coacreditado_1: @document.paterno_coacreditado_1, paterno_coacreditado_2: @document.paterno_coacreditado_2, paterno_coacreditado_3: @document.paterno_coacreditado_3, seccion_rpp: @document.seccion_rpp, ubicacion_juzgado: @document.ubicacion_juzgado, volumen_rpp: @document.volumen_rpp }
    end

    assert_redirected_to document_path(assigns(:document))
  end

  test "should show document" do
    get :show, id: @document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document
    assert_response :success
  end

  test "should update document" do
    put :update, id: @document, document: { box_id: @document.box_id, calle: @document.calle, cofi_id: @document.cofi_id, colonia: @document.colonia, document_type_id: @document.document_type_id, entidad_id: @document.entidad_id, entity_id: @document.entity_id, estado_id: @document.estado_id, fecha_auto_admisorio: @document.fecha_auto_admisorio, fecha_avaluo: @document.fecha_avaluo, fecha_escritura: @document.fecha_escritura, fecha_rpp: @document.fecha_rpp, folio_real_rpp: @document.folio_real_rpp, jurisdiccion_id: @document.jurisdiccion_id, libro_rpp: @document.libro_rpp, materno_acreditado: @document.materno_acreditado, materno_coacreditado_1: @document.materno_coacreditado_1, materno_coacreditado_2: @document.materno_coacreditado_2, materno_coacreditado_3: @document.materno_coacreditado_3, monto_avaluo: @document.monto_avaluo, municipio: @document.municipio, nombre_acreditado: @document.nombre_acreditado, nombre_archivo: @document.nombre_archivo, nombre_coacreditado_1: @document.nombre_coacreditado_1, nombre_coacreditado_2: @document.nombre_coacreditado_2, nombre_coacreditado_3: @document.nombre_coacreditado_3, nombre_notario: @document.nombre_notario, numero_credito: @document.numero_credito, numero_demanda: @document.numero_demanda, numero_escritura: @document.numero_escritura, numero_expediente: @document.numero_expediente, numero_juzgado: @document.numero_juzgado, numero_notaria: @document.numero_notaria, originator_id: @document.originator_id, partida_rpp: @document.partida_rpp, paterno_acreditado: @document.paterno_acreditado, paterno_coacreditado_1: @document.paterno_coacreditado_1, paterno_coacreditado_2: @document.paterno_coacreditado_2, paterno_coacreditado_3: @document.paterno_coacreditado_3, seccion_rpp: @document.seccion_rpp, ubicacion_juzgado: @document.ubicacion_juzgado, volumen_rpp: @document.volumen_rpp }
    assert_redirected_to document_path(assigns(:document))
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete :destroy, id: @document
    end

    assert_redirected_to documents_path
  end
end
