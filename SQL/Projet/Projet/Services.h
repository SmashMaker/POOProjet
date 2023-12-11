#pragma once
#include "Conception.h"
#include "Mappage.h"

namespace NS_Comp_Svc
{
	ref class Services
	{
	private:
		NS_Comp_Data::Conception^ oCad;
		NS_Comp_Mappage::Mappage^ oMappTB;
	public:
		Services(void);
		System::Data::DataSet^ selectionnerDonnee(System::String^ dataTableName);
		void setEtatActuel(int toSet) { this->oMappTB->SetEtatActuel(toSet); }
		void ajouterDonnee(System::String^ colonne, System::String^ valeur);
		void effacerDonnee(System::String^ colonne, System::String^ valeur);
		void updateDonnee(System::String^ colonne, System::String^ valeur, System::String^ conditionColonne, System::String^ conditionValeur);

		System::Data::DataSet^ panier_moyen(System::String^ dataTableName);
		System::Data::DataSet^ chiffre_affaires(System::String^ annee, System::String^ mois, System::String^ dataTableName);
		System::Data::DataSet^ produit_reappro(System::String^ dataTableName);
		System::Data::DataSet^ montant_total(System::String^ dataTableName);
		System::Data::DataSet^ plus_vendus(System::String^ nombre, System::String^ date_debut, System::String^ date_fin, System::String^ dataTableName);
		System::Data::DataSet^ moins_vendus(System::String^ nombre, System::String^ date_debut, System::String^ date_fin, System::String^ dataTableName);
		System::Data::DataSet^ valeur_commer(System::String^ dataTableName);
		System::Data::DataSet^ valeur_achat(System::String^ dataTableName);
		System::Data::DataSet^ simulation(System::String^ dataTableName);
	};
}