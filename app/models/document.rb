class Document < ActiveRecord::Base
  attr_accessible :box_id, :calle, :cofi_id, :colonia, :document_type_id, :entidad_id, :entity_id, :estado_id, :fecha_auto_admisorio, :fecha_avaluo, :fecha_escritura, :fecha_rpp, :folio_real_rpp, :jurisdiccion_id, :libro_rpp, :materno_acreditado, :materno_coacreditado_1, :materno_coacreditado_2, :materno_coacreditado_3, :monto_avaluo, :municipio, :nombre_acreditado, :nombre_archivo, :nombre_coacreditado_1, :nombre_coacreditado_2, :nombre_coacreditado_3, :nombre_notario, :numero_credito, :numero_demanda, :numero_escritura, :numero_expediente, :numero_juzgado, :numero_notaria, :originator_id, :partida_rpp, :paterno_acreditado, :paterno_coacreditado_1, :paterno_coacreditado_2, :paterno_coacreditado_3, :seccion_rpp, :ubicacion_juzgado, :volumen_rpp, :entity_name, :originator_name, :cofi_name, :estado_name, :jurisdiccion_name, :entidad_name
  belongs_to :entity
  belongs_to :document_type
  belongs_to :box
  belongs_to :originator
  belongs_to :cofi
  belongs_to :entidad
  belongs_to :estado
  belongs_to :jurisdiccion

  def entity_name
    entity.try(:name) 
  end

  def entity_name=(name)
    self.entity = Entity.find_by_name(name) if name.present?
  end

  def originator_name
    originator.try(:name)
  end

  def originator_name=(name)
    self.originator = Originator.find_by_name(name) if name.present?
  end

  def cofi_name
    cofi.try(:name)
  end

  def cofi_name=(name)
    self.cofi = Cofi.find_by_name(name) if name.present?
  end

  def estado_name
    estado.try(:name)
  end

  def estado_name=(name)
    self.estado = Estado.find_by_name(name) if name.present?
  end

  def jurisdiccion_name
    jurisdiccion.try(:name)
  end

  def jurisdiccion_name=(name)
    self.jurisdiccion = Jurisdiccion.find_by_name(name) if name.present?
  end

  def entidad_name
    entidad.try(:name)
  end

  def entidad_name=(name)
    self.entidad = Entidad.find_by_name(name) if name.present?
  end
end
