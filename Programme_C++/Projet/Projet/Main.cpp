#include <iostream>
#include <msclr/marshal_cppstd.h> // Inclusion pour marshal_as
#include "Conception.h"
#include "Mappage.h"
#include "Services.h"
#include "MyForm.h"
#include "MyFormGestion.h"
#include "MyFormStats.h"

using namespace System;
using namespace System::Windows::Forms;


[STAThreadAttribute]
int __clrcall WinMain(array<String^>^ args)
{
	Application::EnableVisualStyles();
	Application::SetCompatibleTextRenderingDefault(false);
	Projet::MyForm monFormulaire;
	Application::Run(% monFormulaire);
}
