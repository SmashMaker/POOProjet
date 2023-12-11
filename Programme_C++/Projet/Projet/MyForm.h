#pragma once
#include "MyFormGestion.h"
#include "MyFormStats.h"
#include "Mappage.h"
#include "Services.h"


namespace Projet {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Description résumée de MyForm
	/// </summary>
	public ref class MyForm : public System::Windows::Forms::Form
	{
	public:
		MyForm(void)
		{
			InitializeComponent();
			//
			//TODO: ajoutez ici le code du constructeur
			//
		}

	protected:
		/// <summary>
		/// Nettoyage des ressources utilisées.
		/// </summary>
		~MyForm()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::Button^ Personnel;
	protected:
	private: System::Windows::Forms::Button^ Client;
	private: System::Windows::Forms::Button^ Commande;
	private: System::Windows::Forms::Button^ Produit;
	private: System::Windows::Forms::Button^ Stats;

	private:
		/// <summary>
		/// Variable nécessaire au concepteur.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
		/// le contenu de cette méthode avec l'éditeur de code.
		/// </summary>
		void InitializeComponent(void)
		{
			this->Personnel = (gcnew System::Windows::Forms::Button());
			this->Client = (gcnew System::Windows::Forms::Button());
			this->Commande = (gcnew System::Windows::Forms::Button());
			this->Produit = (gcnew System::Windows::Forms::Button());
			this->Stats = (gcnew System::Windows::Forms::Button());
			this->SuspendLayout();
			// 
			// 
			// 
			this->Personnel->Location = System::Drawing::Point(62, 82);
			this->Personnel->Name = L"Personnels";
			this->Personnel->Size = System::Drawing::Size(128, 76);
			this->Personnel->TabIndex = 0;
			this->Personnel->Text = L"Personnels";
			this->Personnel->UseVisualStyleBackColor = true;
			this->Personnel->Click += gcnew System::EventHandler(this, &MyForm::Personnel_Click);
			// 
			// Client
			// 
			this->Client->Location = System::Drawing::Point(397, 82);
			this->Client->Name = L"Clients";
			this->Client->Size = System::Drawing::Size(128, 76);
			this->Client->TabIndex = 1;
			this->Client->Text = L"Clients";
			this->Client->UseVisualStyleBackColor = true;
			this->Client->Click += gcnew System::EventHandler(this, &MyForm::Client_Click);
			// 
			// Commande
			// 
			this->Commande->Location = System::Drawing::Point(62, 370);
			this->Commande->Name = L"Commandes";
			this->Commande->Size = System::Drawing::Size(128, 76);
			this->Commande->TabIndex = 2;
			this->Commande->Text = L"Commandes";
			this->Commande->UseVisualStyleBackColor = true;
			this->Commande->Click += gcnew System::EventHandler(this, &MyForm::Commande_Click);
			// 
			// Stock
			// 
			this->Produit->Location = System::Drawing::Point(397, 370);
			this->Produit->Name = L"Produits";
			this->Produit->Size = System::Drawing::Size(128, 76);
			this->Produit->TabIndex = 3;
			this->Produit->Text = L"Produits";
			this->Produit->UseVisualStyleBackColor = true;
			this->Produit->Click += gcnew System::EventHandler(this, &MyForm::Produit_Click);
			// 
			// Stats
			// 
			this->Stats->Location = System::Drawing::Point(230, 221);
			this->Stats->Name = L"Statistiques";
			this->Stats->Size = System::Drawing::Size(128, 76);
			this->Stats->TabIndex = 4;
			this->Stats->Text = L"Statistiques";
			this->Stats->UseVisualStyleBackColor = true;
			this->Stats->Click += gcnew System::EventHandler(this, &MyForm::Stats_Click);
			// 
			// MyForm
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(602, 550);
			this->Controls->Add(this->Stats);
			this->Controls->Add(this->Produit);
			this->Controls->Add(this->Commande);
			this->Controls->Add(this->Client);
			this->Controls->Add(this->Personnel);
			this->Name = L"MyForm";
			this->Text = L"MyForm";
			this->ResumeLayout(false);

		}

#pragma endregion
	private: System::Void Personnel_Click(System::Object^ sender, System::EventArgs^ e) {
		NS_Comp_Mappage::Mappage^ mappage = gcnew NS_Comp_Mappage::Mappage();
		mappage->SetEtatActuel(1);

		MyFormGestion^ gestionForm = gcnew MyFormGestion(); // Création d'une instance de MyFormGestion
		gestionForm->Show(); // Affichage du nouveau formulaire
	}
	private: System::Void Client_Click(System::Object^ sender, System::EventArgs^ e) {
		NS_Comp_Mappage::Mappage^ mappage = gcnew NS_Comp_Mappage::Mappage();
		mappage->SetEtatActuel(2);

		MyFormGestion^ gestionForm = gcnew MyFormGestion(); // Création d'une instance de MyFormGestion
		gestionForm->Show(); // Affichage du nouveau formulaire
	}
	private: System::Void Commande_Click(System::Object^ sender, System::EventArgs^ e) {
		NS_Comp_Mappage::Mappage^ mappage = gcnew NS_Comp_Mappage::Mappage();
		mappage->SetEtatActuel(3);

		MyFormGestion^ gestionForm = gcnew MyFormGestion(); // Création d'une instance de MyFormGestion
		gestionForm->Show(); // Affichage du nouveau formulaire
	}
	private: System::Void Produit_Click(System::Object^ sender, System::EventArgs^ e) {
		NS_Comp_Mappage::Mappage^ mappage = gcnew NS_Comp_Mappage::Mappage();
		mappage->SetEtatActuel(4);

		MyFormGestion^ gestionForm = gcnew MyFormGestion(); // Création d'une instance de MyFormGestion
		gestionForm->Show(); // Affichage du nouveau formulaire
	}
	private: System::Void Stats_Click(System::Object^ sender, System::EventArgs^ e) {
		MyFormStats^ gestionForm = gcnew MyFormStats(); // Création d'une instance de MyFormGestion
		gestionForm->Show(); // Affichage du nouveau formulaire
	}
};
}
