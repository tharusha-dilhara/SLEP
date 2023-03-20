<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Str;

class apiController extends Controller
{
    public function register(Request $request){


        $validater=Validator::make($request->all(),[
            "it_id"=>"required",
            "batch"=>"required",
            "group_no"=>"required",
            "name"=>"required",
            "email"=>"required|email",
            "password"=>"required|min:8"
        ]);

        if($validater->fails()){
            return response()->json(
                [
                'satatus'=> 400,
                'message'=>'bad request'
                ],400
            );
        }

        $user=new User();
        $user->it_id=$request->it_id;
        $user->batch=$request->batch;
        $user->group_no=$request->group_no;
        $user->name=$request->name;
        $user->roles=['users'];
        $user->email=$request->email;
        $user->password=bcrypt($request->password);
        $rs=$user->save();
        if($rs){
            return response()->json(
                [
                'satatus'=> 200,
                'message'=>'user registerd'
                ],200
            );
        }else{
            return response()->json(
                [
                'satatus'=> 200,
                'message'=>'user registren faild'
                ],200
            );
        }

    }



    public function login(Request $request){

        $validater=Validator::make($request->all(),[

            "email"=>"required|email",
            "password"=>"required"


        ]);

        if($validater->fails()){
            return response()->json(
                [
                'satatus'=> 400,
                'message'=>'bad request'
                ],400
            );
        }
        if(!Auth::attempt($request->only('email','password'))){
            return response()->json(
                [
                'satatus'=> 401,
                'message'=>'unauthorized'
                ],401
            );
        }

        $user =User::where("email",$request->email)->select('id','name','email','roles')->first();
        $token=$user->createToken($request->email,$user->roles)->plainTextToken;
        Arr::add($user,'token',$token);
        return $user;


    }


    public function getUser(Request $request){
        return response()->json(['user'=>$request->User()]);
    }


    public function logout(Request $request){
        $user=$request->User();
        $user->currentAccessToken()->delete();
        return response()->json(
            [
            'satatus'=> 200,
            'message'=>'User logout'
            ],200
        );

    }



    public function admin(Request $request){
        $user=$request->user();
        if ($user->tokenCan('admin')) {
            return response()->json(
                [
                'satatus'=> 200,
                'message'=> $user->name.'is an admin'
                ],200
            );
        }

        return response()->json(
            [
            'satatus'=> 401,
            'message'=>'unauthorized and not is an admin'
            ],401
        );
    }


}
