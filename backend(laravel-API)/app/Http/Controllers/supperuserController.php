<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\timetable;
use App\Models\subject_supports;
use App\Models\User;

class supperuserController extends Controller
{

    function all(Request $temp){

        $user=$temp->user();
        if($user->tokenCan('supperAdmin')) {
            $rs=timetable::all();
            return $rs;
        }else{
            return  response()->json('privalage is increct,can\'t show all batch timetables ', 401);
        }

    }

    function add_admin(Request $temp){
        $user=$temp->user();
        if($user->tokenCan('supperAdmin')) {
            $user =User::where("it_id",$temp->it_id)->select('id','roles')->first();
            $user->roles=['admin'];
            $res=$user->save();
            if($res){
                return response()->json('user chnge admin role successfull', 200);
            }else{
                return response()->json('user chnge admin role successfull operation faild', 401);
            }
        }else{
            return response()->json('you not  supperadmin', 401);
        }
    }


    function add_subject_support(Request $temp){
        $user=$temp->user();
        if($user->tokenCan('supperAdmin')) {
            $db=new subject_supports;
            $db->batch=$temp->batch;
            $db->group_no=$temp->group_no;
            $db->mod_name=$temp->mod_name;
            $db->link=$temp->link;
            $rs=$db->save();
            if($rs){
                return response()->json('add subject', 200);
            }else{
                return response()->json('add subject operation faild', 200);
            }
        }else{

            return response()->json('you not  supperadmin', 401);
        }

    }


    function delete(Request $temp){
        $user=$temp->user();
        if($user->tokenCan('supperAdmin')) {
            $res=timetable::where('group_no',$temp->group_no)->where('batch',$temp->batch)->delete();
            if($res){
                return response()->json('recode is deleted', 200);
            }else{
                return response()->json('recode is deleted operation faild', 401);
            }
        }else{
            return response()->json('you not  supperadmin', 401);
        }

    }

    function edit_subject_support(Request $temp){
        $user=$temp->user();
        if ($user->tokenCan('supperAdmin')) {
            $user=subject_supports::where('id',$temp->id)->first();
            $user->mod_name=$temp->mod_name;
            $user->link=$temp->link;
            $ss=$user->save();
            if($ss){
                return ["massage"=>"subject_supports update"];
            }else{
                return ["massage"=>"subject_supports update oprition faild"];
            }

        }else{
            return response()->json(
                [
                'satatus'=> 200,
                'message'=> $user->name.'you cant add timetable , privlage is nomal'
                ],200
            );
        }

    }
}
