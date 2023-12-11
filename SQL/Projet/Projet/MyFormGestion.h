#pragma once
#include "Services.h"
#include "Mappage.h"

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
	public ref class MyFormGestion : public System::Windows::Forms::Form
	{
	public:
		MyFormGestion(void)
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
		~MyFormGestion()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::DataGridView^ dgv_enr;
	protected:

	private: System::Windows::Forms::Button^ btn_load;
	private: System::Windows::Forms::Button^ btn_insert;
	private: System::Windows::Forms::Button^ btn_delete;
	private: System::Windows::Forms::Button^ btn_update;
	private: System::Windows::Forms::TextBox^ txt_colonne;
	private: System::Windows::Forms::TextBox^ txt_valeur;
	private: System::Windows::Forms::TextBox^ txt_conditionColonne;

	private: NS_Comp_Svc::Services^ oSvc;
	private: System::Data::DataSet^ oDs;
	private: System::Windows::Forms::TextBox^ txt_conditionValeur;
	private: System::Windows::Forms::Label^ label1;
	private: System::Windows::Forms::Label^ label2;
	private: System::Windows::Forms::Label^ label3;
	private: System::Windows::Forms::Label^ label4;
	protected:

	private:
		/// <summary>
		/// Variable nécessaire au concepteur.
		/// </summary>
		/// Déclarez la variable pour stocker etatActuel
		System::ComponentModel::Container^ components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
		/// le contenu de cette méthode avec l'éditeur de code.
		/// </summary>
		void InitializeComponent(void)
		{
			this->dgv_enr = (gcnew System::Windows::Forms::DataGridView());
			this->btn_load = (gcnew System::Windows::Forms::Button());
			this->btn_insert = (gcnew System::Windows::Forms::Button());
			this->btn_delete = (gcnew System::Windows::Forms::Button());
			this->btn_update = (gcnew System::Windows::Forms::Button());
			this->txt_colonne = (gcnew System::Windows::Forms::TextBox());
			this->txt_valeur = (gcnew System::Windows::Forms::TextBox());
			this->txt_conditionColonne = (gcnew System::Windows::Forms::TextBox());
			this->txt_conditionValeur = (gcnew System::Windows::Forms::TextBox());
			this->label1 = (gcnew System::Windows::Forms::Label());
			this->label2 = (gcnew System::Windows::Forms::Label());
			this->label3 = (gcnew System::Windows::Forms::Label());
			this->label4 = (gcnew System::Windows::Forms::Label());
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->dgv_enr))->BeginInit();
			this->SuspendLayout();
			// 
			// dgv_enr
			// 
			this->dgv_enr->ColumnHeadersHeightSizeMode = System::Windows::Forms::DataGridViewColumnHeadersHeightSizeMode::AutoSize;
			this->dgv_enr->Location = System::Drawing::Point(12, 12);
			this->dgv_enr->Name = L"dgv_enr";
			this->dgv_enr->Size = System::Drawing::Size(472, 150);
			this->dgv_enr->TabIndex = 0;
			// 
			// btn_load
			// 
			this->btn_load->Location = System::Drawing::Point(15, 183);
			this->btn_load->Name = L"btn_load";
			this->btn_load->Size = System::Drawing::Size(75, 129);
			this->btn_load->TabIndex = 1;
			this->btn_load->Text = L"Load DB";
			this->btn_load->UseVisualStyleBackColor = true;
			this->btn_load->Click += gcnew System::EventHandler(this, &MyFormGestion::btn_load_Click);
			// 
			// btn_insert
			// 
			this->btn_insert->Location = System::Drawing::Point(96, 183);
			this->btn_insert->Name = L"btn_insert";
			this->btn_insert->Size = System::Drawing::Size(75, 37);
			this->btn_insert->TabIndex = 2;
			this->btn_insert->Text = L"INS";
			this->btn_insert->UseVisualStyleBackColor = true;
			this->btn_insert->Click += gcnew System::EventHandler(this, &MyFormGestion::btn_insert_Click);
			// 
			// btn_delete
			// 
			this->btn_delete->Location = System::Drawing::Point(96, 275);
			this->btn_delete->Name = L"btn_delete";
			this->btn_delete->Size = System::Drawing::Size(75, 37);
			this->btn_delete->TabIndex = 3;
			this->btn_delete->Text = L"DEL";
			this->btn_delete->UseVisualStyleBackColor = true;
			this->btn_delete->Click += gcnew System::EventHandler(this, &MyFormGestion::btn_delete_Click);
			// 
			// btn_update
			// 
			this->btn_update->Location = System::Drawing::Point(96, 229);
			this->btn_update->Name = L"btn_update";
			this->btn_update->Size = System::Drawing::Size(75, 37);
			this->btn_update->TabIndex = 4;
			this->btn_update->Text = L"UPD";
			this->btn_update->UseVisualStyleBackColor = true;
			this->btn_update->Click += gcnew System::EventHandler(this, &MyFormGestion::btn_update_Click);
			// 
			// txt_colonne
			// 
			this->txt_colonne->Location = System::Drawing::Point(177, 183);
			this->txt_colonne->Name = L"txt_colonne";
			this->txt_colonne->Size = System::Drawing::Size(307, 20);
			this->txt_colonne->TabIndex = 5;
			// 
			// txt_valeur
			// 
			this->txt_valeur->Location = System::Drawing::Point(177, 218);
			this->txt_valeur->Name = L"txt_valeur";
			this->txt_valeur->Size = System::Drawing::Size(307, 20);
			this->txt_valeur->TabIndex = 6;
			// 
			// txt_conditionColonne
			// 
			this->txt_conditionColonne->Location = System::Drawing::Point(177, 255);
			this->txt_conditionColonne->Name = L"txt_conditionColonne";
			this->txt_conditionColonne->Size = System::Drawing::Size(307, 20);
			this->txt_conditionColonne->TabIndex = 7;
			// 
			// txt_conditionValeur
			// 
			this->txt_conditionValeur->Location = System::Drawing::Point(177, 292);
			this->txt_conditionValeur->Name = L"txt_conditionValeur";
			this->txt_conditionValeur->Size = System::Drawing::Size(307, 20);
			this->txt_conditionValeur->TabIndex = 8;
			// 
			// label1
			// 
			this->label1->AutoSize = true;
			this->label1->Location = System::Drawing::Point(174, 167);
			this->label1->Name = L"label1";
			this->label1->Size = System::Drawing::Size(281, 13);
			this->label1->TabIndex = 9;
			this->label1->Text = L"Entrer le nom de la colonne que vous souhaitez manipuler";
			// 
			// label2
			// 
			this->label2->AutoSize = true;
			this->label2->Location = System::Drawing::Point(174, 206);
			this->label2->Name = L"label2";
			this->label2->Size = System::Drawing::Size(35, 13);
			this->label2->TabIndex = 10;
			this->label2->Text = L"Entrer la valeur que vous souhaitez manipuler";
			// 
			// label3
			// 
			this->label3->AutoSize = true;
			this->label3->Location = System::Drawing::Point(174, 241);
			this->label3->Name = L"label3";
			this->label3->Size = System::Drawing::Size(35, 13);
			this->label3->TabIndex = 11;
			this->label3->Text = L"Entrer la colonne de la condition (uniquement pour UPDATE)";
			// 
			// label4
			// 
			this->label4->AutoSize = true;
			this->label4->Location = System::Drawing::Point(174, 278);
			this->label4->Name = L"label4";
			this->label4->Size = System::Drawing::Size(35, 13);
			this->label4->TabIndex = 12;
			this->label4->Text = L"Entrer la valeur de la condition (uniquement pour UPDATE)";
			// 
			// MyFormGestion
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(506, 332);
			this->Controls->Add(this->label4);
			this->Controls->Add(this->label3);
			this->Controls->Add(this->label2);
			this->Controls->Add(this->label1);
			this->Controls->Add(this->txt_conditionValeur);
			this->Controls->Add(this->txt_conditionColonne);
			this->Controls->Add(this->txt_valeur);
			this->Controls->Add(this->txt_colonne);
			this->Controls->Add(this->btn_update);
			this->Controls->Add(this->btn_delete);
			this->Controls->Add(this->btn_insert);
			this->Controls->Add(this->btn_load);
			this->Controls->Add(this->dgv_enr);
			this->Name = L"MyFormGestion";
			this->Text = L"MyFormGestion";
			this->Load += gcnew System::EventHandler(this, &MyFormGestion::MyFormGestion_Load);
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->dgv_enr))->EndInit();
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
	private: System::Void btn_load_Click(System::Object^ sender, System::EventArgs^ e)
	{
		this->dgv_enr->Refresh();
		this->oDs = this->oSvc->selectionnerDonnee("Rsl");
		this->dgv_enr->DataSource = this->oDs;
		this->dgv_enr->DataMember = "Rsl";
	}
	private: System::Void MyFormGestion_Load(System::Object^ sender, System::EventArgs^ e)
	{
		this->oSvc = gcnew NS_Comp_Svc::Services();
		NS_Comp_Mappage::Mappage^ mappageInstance = gcnew NS_Comp_Mappage::Mappage();
		this->oSvc->setEtatActuel(mappageInstance->GetEtatActuel());
	}
	private: System::Void btn_insert_Click(System::Object^ sender, System::EventArgs^ e)
	{
		this->oSvc->ajouterDonnee(this->txt_colonne->Text, this->txt_valeur->Text);
	}
	private: System::Void btn_delete_Click(System::Object^ sender, System::EventArgs^ e)
	{
		this->oSvc->effacerDonnee(this->txt_colonne->Text, this->txt_valeur->Text);
	}
	private: System::Void btn_update_Click(System::Object^ sender, System::EventArgs^ e)
	{
		this->oSvc->updateDonnee(this->txt_colonne->Text, this->txt_valeur->Text, this->txt_conditionColonne->Text, this->txt_conditionValeur->Text);
	}
};
}