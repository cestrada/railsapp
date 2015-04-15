class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer   :box_id
      t.integer   :document_type_id
      t.integer   :numero_credito
      t.integer   :numero_escritura
      t.date      :fecha_escritura
      t.string    :nombre_notario
      t.integer   :numero_notaria
      t.integer   :entity_id
      t.string    :nombre_acreditado
      t.string    :paterno_acreditado
      t.string    :materno_acreditado
      t.string    :nombre_coacreditado_1
      t.string    :paterno_coacreditado_1
      t.string    :materno_coacreditado_1
      t.string    :nombre_coacreditado_2
      t.string    :paterno_coacreditado_2
      t.string    :materno_coacreditado_2
      t.string    :nombre_coacreditado_3
      t.string    :paterno_coacreditado_3
      t.string    :materno_coacreditado_3
      t.integer   :originator_id
      t.integer   :cofi_id
      t.string    :calle
      t.string    :colonia
      t.string    :municipio
      t.integer   :estado_id
      t.integer   :jurisdiccion_id
      t.string    :folio_real_rpp
      t.string    :seccion_rpp
      t.string    :libro_rpp
      t.string    :volumen_rpp
      t.string    :partida_rpp
      t.date      :fecha_rpp
      t.integer   :entidad_id
      t.date      :fecha_avaluo
      t.decimal   :monto_avaluo
      t.string    :nombre_archivo
      t.integer   :numero_demanda
      t.integer   :numero_expediente
      t.integer   :numero_juzgado
      t.string    :ubicacion_juzgado
      t.date      :fecha_auto_admisorio

      t.timestamps
    end
    add_index :documents, :box_id
    add_index :documents, :document_type_id
    add_index :documents, :numero_credito
    add_index :documents, :numero_escritura
    add_index :documents, :numero_notaria
    add_index :documents, :entity_id
    add_index :documents, :originator_id
    add_index :documents, :cofi_id
    add_index :documents, :estado_id
    add_index :documents, :jurisdiccion_id
    add_index :documents, :entidad_id
    add_index :documents, :numero_demanda
    add_index :documents, :numero_expediente
    add_index :documents, :numero_juzgado
  end
end
