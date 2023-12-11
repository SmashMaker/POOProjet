#pragma once

namespace NS_Comp_Mappage
{
	ref class Mappage
	{
	private:
		System::String^ sSql;

		System::String^ colonne;
		System::String^ valeur;
		System::String^ conditionColonne;
		System::String^ conditionValeur;


		System::String^ annee;
		System::String^ mois;
		System::String^ nombre;
		System::String^ date_debut;
		System::String^ date_fin;

		static int etatActuel = 0;
	public:
		System::String^ Select(void);
		System::String^ Insert(void);
		System::String^ Delete(void);
		System::String^ Update(void);
		static int GetEtatActuel()
		{
			return etatActuel;
		}
		void SetEtatActuel(int etat);
		void NS_Comp_Mappage::Mappage::setColonne(System::String^ colonne)
		{
			this->colonne = colonne;
		}
		void NS_Comp_Mappage::Mappage::setValeur(System::String^ valeur)
		{
			this->valeur = valeur;
		}
		void NS_Comp_Mappage::Mappage::setConditionColonne(System::String^ conditionColonne)
		{
			this->conditionColonne = conditionColonne ;
		}
		void NS_Comp_Mappage::Mappage::setConditionValeur(System::String^ conditionValeur)
		{
			this->conditionValeur = conditionValeur ;
		}
		System::String^ NS_Comp_Mappage::Mappage::getColonne(void) { return this->colonne; }
		System::String^ NS_Comp_Mappage::Mappage::getValeur(void) { return this->valeur; }
		System::String^ NS_Comp_Mappage::Mappage::getConditionColonne(void) { return this->conditionColonne; }
		System::String^ NS_Comp_Mappage::Mappage::getConditionValeur(void) { return this->conditionValeur; }


		System::String^ panier(void);
		System::String^ affaires(void);
		System::String^ seuil(void);
		System::String^ montant(void);
		System::String^ plus(void);
		System::String^ moins(void);
		System::String^ commerciale(void);
		System::String^ achat(void);
		System::String^ simu(void);

		void NS_Comp_Mappage::Mappage::setAnnee(System::String^ annee)
		{
			this->annee = annee;
		}
		void NS_Comp_Mappage::Mappage::setMois(System::String^ mois)
		{
			this->mois = mois;
		}
		void NS_Comp_Mappage::Mappage::setNombre(System::String^ nombre)
		{
			this->nombre = nombre;
		}
		void NS_Comp_Mappage::Mappage::setDebut(System::String^ date_debut)
		{
			this->date_debut = date_debut;
		}
		void NS_Comp_Mappage::Mappage::setFin(System::String^ date_fin)
		{
			this->date_fin = date_fin;
		}
		System::String^ NS_Comp_Mappage::Mappage::getAnnee(void) { return this->annee; }
		System::String^ NS_Comp_Mappage::Mappage::getMois(void) { return this->mois; }
		System::String^ NS_Comp_Mappage::Mappage::getNombre(void) { return this->nombre; }
		System::String^ NS_Comp_Mappage::Mappage::getDebut(void) { return this->date_debut; }
		System::String^ NS_Comp_Mappage::Mappage::getFin(void) { return this->date_fin; }
	};
}