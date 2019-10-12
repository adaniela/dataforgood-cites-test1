class CreateOrganisms < ActiveRecord::Migration[5.2]
  def change
    create_table :organisms do |t|
      t.string :taxonRank
      t.integer :idCITES
      t.string :nomSC

      t.timestamps
    end
  end
end
