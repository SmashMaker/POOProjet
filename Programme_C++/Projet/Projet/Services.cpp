#include "Services.h"

NS_Comp_Svc::Services::Services(void)
{
	this->oCad = gcnew NS_Comp_Data::Conception();
		this->oMappTB = gcnew NS_Comp_Mappage::Mappage();
}
System::Data::DataSet^ NS_Comp_Svc::Services::selectionnerDonnee(System::String^ dataTableName)
{
	System::String^ sql;

	sql = this->oMappTB->Select();
	return this->oCad->getRows(sql, dataTableName);
}
void NS_Comp_Svc::Services::ajouterDonnee(System::String^ colonne, System::String^ valeur)
{
	System::String^ sql;

	this->oMappTB->setColonne(colonne);
	this->oMappTB->setValeur(valeur);

	sql = this->oMappTB->Insert();
	this->oCad->actionRows(sql);
}

void NS_Comp_Svc::Services::effacerDonnee(System::String^ colonne, System::String^ valeur)
{
	System::String^ sql;

	this->oMappTB->setColonne(colonne);
	this->oMappTB->setValeur(valeur);

	sql = this->oMappTB->Delete();
	this->oCad->actionRows(sql);
}

void NS_Comp_Svc::Services::updateDonnee(System::String^ colonne, System::String^ valeur, System::String^ conditionColonne, System::String^ conditionValeur)
{
	System::String^ sql;

	this->oMappTB->setColonne(colonne);
	this->oMappTB->setValeur(valeur);
	this->oMappTB->setConditionColonne(conditionColonne);
	this->oMappTB->setConditionValeur(conditionValeur);

	sql = this->oMappTB->Update();
	this->oCad->actionRows(sql);
}

System::Data::DataSet^ NS_Comp_Svc::Services::panier_moyen(System::String^ dataTableName)
{
	System::String^ sql;

	sql = this->oMappTB->panier();
	return this->oCad->getRows(sql, dataTableName);
}
System::Data::DataSet^ NS_Comp_Svc::Services::chiffre_affaires(System::String^ dataTableName, System::String^ annee, System::String^ mois)
{
	System::String^ sql;

	this->oMappTB->setAnnee(annee);
	this->oMappTB->setMois(mois);

	sql = this->oMappTB->affaires();
	return this->oCad->getRows(sql, dataTableName);
}

System::Data::DataSet^ NS_Comp_Svc::Services::produit_reappro(System::String^ dataTableName)
{
	System::String^ sql;

	sql = this->oMappTB->seuil();
	return this->oCad->getRows(sql, dataTableName);
}
System::Data::DataSet^ NS_Comp_Svc::Services::montant_total(System::String^ dataTableName)
{
	System::String^ sql;

	sql = this->oMappTB->montant();
	return this->oCad->getRows(sql, dataTableName);
}
System::Data::DataSet^ NS_Comp_Svc::Services::plus_vendus(System::String^ dataTableName, System::String^ nombre, System::String^ date_debut, System::String^ date_fin)
{
	System::String^ sql;

	this->oMappTB->setNombre(nombre);
	this->oMappTB->setDebut(date_debut);
	this->oMappTB->setFin(date_fin);

	sql = this->oMappTB->plus();
	return this->oCad->getRows(sql, dataTableName);
}
System::Data::DataSet^ NS_Comp_Svc::Services::moins_vendus(System::String^ dataTableName, System::String^ nombre, System::String^ date_debut, System::String^ date_fin)
{
	System::String^ sql;

	this->oMappTB->setNombre(nombre);
	this->oMappTB->setDebut(date_debut);
	this->oMappTB->setFin(date_fin);

	sql = this->oMappTB->moins();
	return this->oCad->getRows(sql, dataTableName);
}
System::Data::DataSet^ NS_Comp_Svc::Services::valeur_commer(System::String^ dataTableName)
{
	System::String^ sql;

	sql = this->oMappTB->commerciale();
	return this->oCad->getRows(sql, dataTableName);
}
System::Data::DataSet^ NS_Comp_Svc::Services::valeur_achat(System::String^ dataTableName)
{
	System::String^ sql;

	sql = this->oMappTB->achat();
	return this->oCad->getRows(sql, dataTableName);
}

System::Data::DataSet^ NS_Comp_Svc::Services::simulation(System::String^ dataTableName)
{
	System::String^ sql;

	sql = this->oMappTB->simu();
	return this->oCad->getRows(sql, dataTableName);
}
