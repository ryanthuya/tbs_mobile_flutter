<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Termwind\Components\Raw;

class StudentController extends Controller
{
    public function index(){
        $students = Student::all();
        return response()->json($students);
        // return response()->json([
        //     "success" => true,
        //     "message" => "Get All Students List",
        //     "data" => $students
        //     ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'age' => 'required',
            ]);
        $student = new Student();
        $student->name = $request->name;
        $student->age = $request->age;
        $student->save();
        // return response()->json([
        //     "message" => "Student Added."
        // ], 201);
        return response()->json([
            "success" => true,
            "message" => "Added A New Student.",
            "data" => $student
            ]);
    }
    public function show($id){
        $student = Student::find($id);
        if(!empty($student))
        {
            //return response()->json($student);
            return response()->json([
                "success" => true,
                "message" => "Detailed Information of Student.",
                "data" => $student
                ]);
        }
        else
        {
            return response()->json([
                "message" => "Student not found"
            ], 404);
        }
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'age' => 'required',
            ]);
        if (Student::where('id', $id)->exists()) {
            $student = Student::find($id);
            $student->name = is_null($request->name) ? $student->name : $request->name;
            $student->age = is_null($request->age) ? $student->age : $request->age;
            $student->save();
            // return response()->json([
            //     "message" => "Student Updated."
            // ], 404);
            return response()->json([
                "success" => true,
                "message" => "Student Updated",
                "data" => $student
                ]);
        }else{
            return response()->json([
                "message" => "Student Not Found."
            ], 404);
        }
    }
    public function destroy($id)
    {
        if(Student::where('id', $id)->exists()) {
            $student = Student::find($id);
            $student->delete();

            return response()->json([
              "message" => "records deleted."
            ], 202);
        } else {
            return response()->json([
              "message" => "student not found."
            ], 404);
        }
    }
}
