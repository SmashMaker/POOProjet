#include "Services.h"

#pragma once

namespace Projet {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Description résumée de MyFormStats
	/// </summary>
	public ref class MyFormStats : public System::Windows::Forms::Form
	{
	public:
		MyFormStats(void)
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
		~MyFormStats()
		{
			if (components)
			{
				delete components;
			}
		}
	private: NS_Comp_Svc::Services^ oSvc;
	private: System::Data::DataSet^ oDs;

	private: System::Windows::Forms::DataGridView^ dgv_enr;
	protected:
	private: System::Windows::Forms::ComboBox^ comboBox1;
	private: System::Windows::Forms::Label^ label1;
	private: System::Windows::Forms::Button^ button1;
	private: System::Windows::Forms::GroupBox^ groupBox1;
	private: System::Windows::Forms::Label^ label3;
	private: System::Windows::Forms::Label^ label2;
	private: System::Windows::Forms::TextBox^ txt_annee;
	private: System::Windows::Forms::TextBox^ txt_mois;
	private: System::Windows::Forms::GroupBox^ groupBox2;
	private: System::Windows::Forms::Label^ label6;
	private: System::Windows::Forms::TextBox^ txt_fin;
	private: System::Windows::Forms::Label^ label4;
	private: System::Windows::Forms::Label^ label5;
	private: System::Windows::Forms::TextBox^ txt_nombre;
	private: System::Windows::Forms::TextBox^ txt_debut;

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
			this->dgv_enr = (gcnew System::Windows::Forms::DataGridView());
			this->comboBox1 = (gcnew System::Windows::Forms::ComboBox());
			this->label1 = (gcnew System::Windows::Forms::Label());
			this->button1 = (gcnew System::Windows::Forms::Button());
			this->groupBox1 = (gcnew System::Windows::Forms::GroupBox());
			this->label3 = (gcnew System::Windows::Forms::Label());
			this->label2 = (gcnew System::Windows::Forms::Label());
			this->txt_annee = (gcnew System::Windows::Forms::TextBox());
			this->txt_mois = (gcnew System::Windows::Forms::TextBox());
			this->groupBox2 = (gcnew System::Windows::Forms::GroupBox());
			this->label6 = (gcnew System::Windows::Forms::Label());
			this->txt_fin = (gcnew System::Windows::Forms::TextBox());
			this->label4 = (gcnew System::Windows::Forms::Label());
			this->label5 = (gcnew System::Windows::Forms::Label());
			this->txt_nombre = (gcnew System::Windows::Forms::TextBox());
			this->txt_debut = (gcnew System::Windows::Forms::TextBox());
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->dgv_enr))->BeginInit();
			this->groupBox1->SuspendLayout();
			this->groupBox2->SuspendLayout();
			this->SuspendLayout();
			// 
			// dgv_enr
			// 
			this->dgv_enr->ColumnHeadersHeightSizeMode = System::Windows::Forms::DataGridViewColumnHeadersHeightSizeMode::AutoSize;
			this->dgv_enr->Location = System::Drawing::Point(12, 12);
			this->dgv_enr->Name = L"dgv_enr";
			this->dgv_enr->Size = System::Drawing::Size(566, 233);
			this->dgv_enr->TabIndex = 0;
			this->dgv_enr->AllowUserToDeleteRows = true;
			// 
			// comboBox1
			// 
			this->comboBox1->FormattingEnabled = true;
			this->comboBox1->Items->AddRange(gcnew cli::array< System::Object^  >(9) {
				L"Calculer le panier moyen", L"Calculer le chiffre d\'affaires",
					L"Identifier produits sous seuil", L"Calculer montant total des clients", L"Identifier articles plus vendus", L"Identifier articles moins vendu",
					L"Calculer valeur commerciale", L"Calculer valeur d\'achat", L"Simulation"
			});
			this->comboBox1->Location = System::Drawing::Point(12, 278);
			this->comboBox1->Name = L"comboBox1";
			this->comboBox1->Size = System::Drawing::Size(175, 21);
			this->comboBox1->TabIndex = 1;
			this->comboBox1->SelectedIndexChanged += gcnew System::EventHandler(this, &MyFormStats::comboBox1_SelectedIndexChanged);
			// 
			// label1
			// 
			this->label1->AutoSize = true;
			this->label1->Location = System::Drawing::Point(12, 262);
			this->label1->Name = L"label1";
			this->label1->Size = System::Drawing::Size(175, 13);
			this->label1->TabIndex = 2;
			this->label1->Text = L"Choisissez votre commande désirée";
			// 
			// button1
			// 
			this->button1->Location = System::Drawing::Point(203, 276);
			this->button1->Name = L"button1";
			this->button1->Size = System::Drawing::Size(175, 23);
			this->button1->TabIndex = 3;
			this->button1->Text = L"Exécuter la commande";
			this->button1->UseVisualStyleBackColor = true;
			this->button1->Click += gcnew System::EventHandler(this, &MyFormStats::button1_Click);
			// 
			// groupBox1
			// 
			this->groupBox1->Controls->Add(this->label3);
			this->groupBox1->Controls->Add(this->label2);
			this->groupBox1->Controls->Add(this->txt_annee);
			this->groupBox1->Controls->Add(this->txt_mois);
			this->groupBox1->Location = System::Drawing::Point(12, 324);
			this->groupBox1->Name = L"groupBox1";
			this->groupBox1->Size = System::Drawing::Size(200, 100);
			this->groupBox1->TabIndex = 4;
			this->groupBox1->TabStop = false;
			this->groupBox1->Text = L"Chiffre d\'affaires";
			this->groupBox1->Enter += gcnew System::EventHandler(this, &MyFormStats::groupBox1_Enter);
			// 
			// label3
			// 
			this->label3->AutoSize = true;
			this->label3->Location = System::Drawing::Point(112, 74);
			this->label3->Name = L"label3";
			this->label3->Size = System::Drawing::Size(82, 13);
			this->label3->TabIndex = 8;
			this->label3->Text = L"Mois (en chiffre)";
			// 
			// label2
			// 
			this->label2->AutoSize = true;
			this->label2->Location = System::Drawing::Point(112, 34);
			this->label2->Name = L"label2";
			this->label2->Size = System::Drawing::Size(38, 13);
			this->label2->TabIndex = 7;
			this->label2->Text = L"Année";
			// 
			// txt_annee
			// 
			this->txt_annee->Location = System::Drawing::Point(6, 34);
			this->txt_annee->Name = L"txt_annee";
			this->txt_annee->Size = System::Drawing::Size(100, 20);
			this->txt_annee->TabIndex = 5;
			// 
			// txt_mois
			// 
			this->txt_mois->Location = System::Drawing::Point(6, 74);
			this->txt_mois->Name = L"txt_mois";
			this->txt_mois->Size = System::Drawing::Size(100, 20);
			this->txt_mois->TabIndex = 6;
			// 
			// groupBox2
			// 
			this->groupBox2->Controls->Add(this->label6);
			this->groupBox2->Controls->Add(this->txt_fin);
			this->groupBox2->Controls->Add(this->label4);
			this->groupBox2->Controls->Add(this->label5);
			this->groupBox2->Controls->Add(this->txt_nombre);
			this->groupBox2->Controls->Add(this->txt_debut);
			this->groupBox2->Location = System::Drawing::Point(261, 324);
			this->groupBox2->Name = L"groupBox2";
			this->groupBox2->Size = System::Drawing::Size(200, 151);
			this->groupBox2->TabIndex = 5;
			this->groupBox2->TabStop = false;
			this->groupBox2->Text = L"Articles les plus/moins vendus";
			// 
			// label6
			// 
			this->label6->AutoSize = true;
			this->label6->Location = System::Drawing::Point(112, 116);
			this->label6->Name = L"label6";
			this->label6->Size = System::Drawing::Size(59, 13);
			this->label6->TabIndex = 10;
			this->label6->Text = L"Date de fin";
			// 
			// txt_fin
			// 
			this->txt_fin->Location = System::Drawing::Point(6, 116);
			this->txt_fin->Name = L"txt_fin";
			this->txt_fin->Size = System::Drawing::Size(100, 20);
			this->txt_fin->TabIndex = 9;
			// 
			// label4
			// 
			this->label4->AutoSize = true;
			this->label4->Location = System::Drawing::Point(112, 37);
			this->label4->Name = L"label4";
			this->label4->Size = System::Drawing::Size(44, 13);
			this->label4->TabIndex = 8;
			this->label4->Text = L"Nombre";
			// 
			// label5
			// 
			this->label5->AutoSize = true;
			this->label5->Location = System::Drawing::Point(112, 77);
			this->label5->Name = L"label5";
			this->label5->Size = System::Drawing::Size(75, 13);
			this->label5->TabIndex = 7;
			this->label5->Text = L"Date de début";
			// 
			// txt_nombre
			// 
			this->txt_nombre->Location = System::Drawing::Point(6, 34);
			this->txt_nombre->Name = L"txt_nombre";
			this->txt_nombre->Size = System::Drawing::Size(100, 20);
			this->txt_nombre->TabIndex = 5;
			// 
			// txt_debut
			// 
			this->txt_debut->Location = System::Drawing::Point(6, 74);
			this->txt_debut->Name = L"txt_debut";
			this->txt_debut->Size = System::Drawing::Size(100, 20);
			this->txt_debut->TabIndex = 6;
			// 
			// MyFormStats
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(590, 567);
			this->Controls->Add(this->groupBox2);
			this->Controls->Add(this->groupBox1);
			this->Controls->Add(this->button1);
			this->Controls->Add(this->label1);
			this->Controls->Add(this->comboBox1);
			this->Controls->Add(this->dgv_enr);
			this->Name = L"MyFormStats";
			this->Text = L"MyFormStats";
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->dgv_enr))->EndInit();
			this->groupBox1->ResumeLayout(false);
			this->groupBox1->PerformLayout();
			this->groupBox2->ResumeLayout(false);
			this->groupBox2->PerformLayout();
			this->Load += gcnew System::EventHandler(this, &MyFormStats::MyFormStats_Load);
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
	private: System::Void comboBox1_SelectedIndexChanged(System::Object^ sender, System::EventArgs^ e) {
	}
	private: System::Void button1_Click(System::Object^ sender, System::EventArgs^ e) {
		if (this->comboBox1->SelectedIndex == 0){
			this->dgv_enr->Columns->Clear();
			this->dgv_enr->DataSource = nullptr;
			this->dgv_enr->Refresh();
			
			this->oDs = this->oSvc->panier_moyen("Rsl");
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
		if (this->comboBox1->SelectedIndex == 1) {
			this->dgv_enr->Columns->Clear();
			this->dgv_enr->DataSource = nullptr;
			this->dgv_enr->Refresh();
			
			this->oDs = this->oSvc->chiffre_affaires("Rsl", this->txt_annee->Text, this->txt_mois->Text);
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
		if (this->comboBox1->SelectedIndex == 2) {
			this->dgv_enr->Columns->Clear();
			this->dgv_enr->DataSource = nullptr;
			this->dgv_enr->Refresh();

			
			this->oDs = this->oSvc->produit_reappro("Rsl");
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
		if (this->comboBox1->SelectedIndex == 3) {
			this->dgv_enr->Columns->Clear();
			this->dgv_enr->Refresh();
			this->dgv_enr->DataSource = nullptr;
			this->oDs = this->oSvc->montant_total("Rsl");
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
		if (this->comboBox1->SelectedIndex == 4) {
			this->dgv_enr->Columns->Clear();
			this->dgv_enr->Refresh();
			this->dgv_enr->DataSource = nullptr;
			this->oDs = this->oSvc->plus_vendus("Rsl", this->txt_nombre->Text, this->txt_debut->Text, this->txt_fin->Text);
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
		if (this->comboBox1->SelectedIndex == 5) {
			this->dgv_enr->Columns->Clear();
			this->dgv_enr->Refresh();
			this->dgv_enr->DataSource = nullptr;
			this->oDs = this->oSvc->moins_vendus("Rsl", this->txt_nombre->Text, this->txt_debut->Text, this->txt_fin->Text);
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
		if (this->comboBox1->SelectedIndex == 6) {
			this->dgv_enr->Columns->Clear();
			this->dgv_enr->Refresh();
			this->dgv_enr->DataSource = nullptr;
			this->oDs = this->oSvc->valeur_commer("Rsl");
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
		if (this->comboBox1->SelectedIndex == 7) {
			this->dgv_enr->Columns->Clear();
			this->dgv_enr->Refresh();
			this->dgv_enr->DataSource = nullptr;
			this->oDs = this->oSvc->valeur_achat("Rsl");
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
		if (this->comboBox1->SelectedIndex == 8) {
			this->dgv_enr->Refresh();
			this->oDs = this->oSvc->simulation("Rsl");
			this->dgv_enr->DataSource = this->oDs;
			this->dgv_enr->DataMember = "Rsl";
		}
	}
	private: System::Void MyFormStats_Load(System::Object^ sender, System::EventArgs^ e)
	{
		this->oSvc = gcnew NS_Comp_Svc::Services();
		NS_Comp_Mappage::Mappage^ mappageInstance = gcnew NS_Comp_Mappage::Mappage();
	}
	private: System::Void groupBox1_Enter(System::Object^ sender, System::EventArgs^ e) {
	}
};
}