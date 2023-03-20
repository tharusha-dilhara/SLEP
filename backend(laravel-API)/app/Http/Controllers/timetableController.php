<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\timetable;
use App\Models\subject_supports;
use App\Models\alert;
use Carbon\Carbon;

class timetableController extends Controller
{

    function all(Request $temp){
        $user=$temp->user();

            $res=timetable::where('group_no',$temp->group_no)->where('batch',$temp->batch)->get();
            return $res;

    }

    function edit(Request $temp){
        $user=$temp->user();
        if ($user->tokenCan('admin')) {
            $user=timetable::where('id',$temp->id)->first();
            $user->start_time=$temp->start_time;
            $user->end_time=$temp->end_time;
            $user->mod_name=$temp->mod_name;
            $user->date=$temp->date;
            $user->location=$temp->location;

            $ss=$user->save();
            if($ss){
                return ["massage"=>"record update"];
            }else{
                return ["massage"=>"record update operation faild"];
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


    function add(Request $temp){
        $user=$temp->user();
        if ($user->tokenCan('admin')) {
            $db=new timetable;
            $db->batch=$temp->batch;
            $db->group_no=$temp->group_no;
            $db->date=$temp->date;
            $db->start_time=$temp->start_time;
            $db->end_time=$temp->end_time;
            $db->mod_name=$temp->mod_name;
            $db->location=$temp->location;
            $ss=$db->save();
            if($ss){
                return ["massage"=>"record add"];
            }else{
                return ["massage"=>"record add operation faild"];
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

    function delete_titmetable(Request $temp){
        $user=$temp->user();
        if ($user->tokenCan('admin')) {
            $res=timetable::where('group_no',$temp->group_no)->where('batch',$temp->batch)->where('date',$temp->date)->where('start_time',$temp->start_time)->where('mod_name',$temp->mod_name)->first();
            $ss=$res->delete();
            if($ss){
                return ["massage"=>"record delete"];
            }else{
                return ["massage"=>"record delete operation faild"];
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





    function get_timetable(Request $data){

        date_default_timezone_set("Asia/Colombo");
        $current_date=strtolower(date("l"));

        $select_all_data= timetable::select('batch','group_no', 'date' , 'start_time' , 'end_time' ,'mod_name' ,'location')
        ->where('group_no', $data->group_no)
        ->where('date', $current_date)
        ->where('batch',$data->batch)
        ->get();



        $current_time=date('G:i:s');
        $ob_current_time=new Carbon($current_time);
        $final=array();

        foreach($select_all_data as $temp){

            $start_time=$temp["start_time"];
            $start_time=new Carbon($start_time);
            // dd([$start_time,$ob_current_time]);

            if($start_time->gt($ob_current_time)){
            $time_difference_in_minutes = $start_time->diffInMinutes($ob_current_time);
		    $time_difference_in_hours=$start_time->diffInHours($ob_current_time);
            $time_difference_in_seconds=$start_time->diffInSeconds($ob_current_time);
            $dis_m=$time_difference_in_minutes- (60 * $time_difference_in_hours);
            $dis_s=$time_difference_in_seconds - (60*$time_difference_in_minutes);
            $dis_h=$time_difference_in_hours;
            // dd([$dis_h,$dis_m,$dis_s]);
            $temp['begin']=$dis_h.':'.$dis_m.':'.$dis_s;
            array_push($final,$temp);
            }
        }
        return $final;

    }


    function subject_support(Request $temp){
            $res=subject_supports::select('mod_name')->where('group_no',$temp->group_no)->where('batch',$temp->batch)->get();
            $subject_a=array();
            foreach($res as $tt){
                array_push($subject_a,$tt["mod_name"]);
            }
            return $subject_a;

    }

    function subject_support_link(Request $temp){
            $res=subject_supports::select('link')->where('group_no',$temp->group_no)->where('batch',$temp->batch)->where('mod_name',$temp->mod_name)->get();
            $subject_link=array();
            foreach($res as $data){
                array_push($subject_link,$data['link']);
            }
            return $subject_link;
    }


    function notification(Request $temp){
            $res=alert::select('alert')->where('group_no',$temp->group_no)->where('batch',$temp->batch)->get();
            $ff=array();
            foreach($res as $tt){
                array_push($ff,$tt["alert"]);
            }

            return $ff;


    }






}
